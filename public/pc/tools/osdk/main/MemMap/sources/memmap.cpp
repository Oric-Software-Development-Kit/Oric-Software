/*==============================================================================

MemMap

==[Description]=================================================================

Generate an html file representing the memory map of provided files.

==============================================================================*/

#pragma warning( disable : 4706)
#pragma warning( disable : 4786)


#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <fcntl.h>
#include <sys/stat.h>

#include <string>
#include <map>
#include <set>

#include "infos.h"

#include "common.h"


const char gHtmlHeader[]=
"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">\r\n"
"<HTML lang=fr dir=ltr>\r\n"
"	<HEAD>\r\n"
"		<meta name=\"robots\" content=\"noindex\">\r\n"
"		<meta http-equiv=\"Content-Type\" content=\"text/html;charset=iso-8859-1\">\r\n"
"		<title>{PageTitle}</title>\r\n"
"		<link href=\"{CssLink}\" rel=\"stylesheet\" type=\"text/css\">\r\n"
"	</HEAD>\r\n"
"	<BODY>\r\n"
"<hr>\r\n"
"<center>{PageTitle}</center>\r\n"
"<hr>\r\n";


//#define VERSION_STRING ##TOOL_VERSION_MAJOR":"##TOOL_VERSION_MINOR

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

const char gHtmlFooter[]=
"<hr>\r\n"
"<center>Generated by MemMap version " TOSTRING(TOOL_VERSION_MAJOR) "." TOSTRING(TOOL_VERSION_MINOR) "</center>\r\n"
"<hr>\r\n"
"	</BODY>\r\n"
"</HTML>\r\n";

class Block
{
public:
  Block(int address) :
    m_address(address),
    m_block_size(0),
    m_total_size(0),
    m_sub_entries(0)
  {
  }

  bool operator <(const Block& other) const
  {
    return m_address<other.m_address;
  }

  bool IsMasterBlock() const
  {
    std::set<std::string>::const_iterator it=m_labels.begin();
    while (it!=m_labels.end())
    {
      const std::string& label=*it;
      if (
            ((label.size()>=1) && (label[0]=='_')) ||
            ((label.size()>=4) && (label[0]=='o') && (label[1]=='s')&& (label[2]=='d') && (label[3]=='k'))
         )
      {
        return true;
      }
      ++it;
    }
    return false;
  }

//private:
  int                     m_address;
  int                     m_block_size;
  int                     m_total_size;
  int                     m_sub_entries;
  std::set<std::string>   m_labels;
};


class Section
{
public:
  Section() :
    m_adress_size(4),
    m_begin_adress(0),
    m_end_adress(65535)
  {
  }

  bool HasData() const
  {
    return !m_map_data.empty();
  }

  void Generate(std::string &ref_html);

  void AddSymbol(int address,const std::string label)
  {
    Block newBlock(address);
    std::pair<std::set<Block>::iterator,bool> insertIt=m_map_data.insert(newBlock);
    std::set<Block>::iterator it=insertIt.first;
    Block& block=const_cast<Block&>(*it); // The C++ norm states that dereferencing a std::set returns a const reference, because modifying the key would require modifying the container itself
    block.m_labels.insert(label);
  }

  std::set<Block> &GetMap()
  {
    return m_map_data;
  }

public:
  std::string	    m_anchor_name;
  std::string	    m_section_name;
  int		    m_adress_size;
  int		    m_begin_adress;
  int		    m_end_adress;

  std::set<Block>   m_map_data;
};


void Section::Generate(std::string &html)
{
  html+="<a name=\""+m_anchor_name+"\"></a>\r\n";

  html+="<h1>"+m_section_name+"</h1>\r\n";

  html+="<table border>\r\n";
  html+="<tr>\r\n";
  html+="<th>Adress</th><th colspan=\"2\">Size</th><th>Name</th>\r\n";
  html+="</tr>\r\n";

  //
  // First pass compute the size
  //
  {
    Block* ptr_master_block=0;

    std::set<Block>::iterator it=m_map_data.begin();
    while (it!=m_map_data.end())
    {
      Block& block=const_cast<Block&>(*it);
      if (block.IsMasterBlock())
      {
        ptr_master_block=&block;
      }

      int address =block.m_address;
      ++it;

      if (it!=m_map_data.end())
      {
        block.m_block_size=(*it).m_address-address;
      }
      else
      {
        block.m_block_size=m_end_adress-address;
      }

      if (ptr_master_block)
      {
        ptr_master_block->m_sub_entries++;
        ptr_master_block->m_total_size+=block.m_block_size;
      }

      //Block& block=(*it);

    }
  }

  //
  // Second pass generates the html
  //
  {
    std::set<Block>::iterator it=m_map_data.begin();
    while (it!=m_map_data.end())
    {
      const Block& block=const_cast<Block&>(*it);
      const int address =block.m_address;
      const std::set<std::string>& labels=block.m_labels;
      ++it;

      char buffer_adress[512];
      if (address&255)
      {
        sprintf(buffer_adress,"$%02x",address);
      }
      else
      {
        sprintf(buffer_adress,"<b>$%02x</b>",address);
      }

      char buffer_size[512];
      /*
      if (it!=m_map_data.end())
      {
        sprintf(buffer_size,"%d",(*it).m_address-address);
      }
      else
      {
        sprintf(buffer_size,"%d",m_end_adress-address);
        //sprintf(buffer_size,"???");
      }
      */
      html+="<tr>\r\n";
      html+=(std::string)"<td>"+buffer_adress+"</td>";

      if ( (block.m_total_size) ) // && (block.m_total_size!=block.m_block_size) )
      {
        // Master block
        sprintf(buffer_size,"<td align=\"right\">%d</td><td align=\"right\">%d</td>",block.m_total_size,block.m_block_size);
      }
      else
      {
        // Normal block
        sprintf(buffer_size,"<td colspan=\"2\" align=\"right\">%d</td>",block.m_block_size);
      }
      html+=buffer_size;

      html+="<td>";
      std::set<std::string>::const_iterator labelsIt=labels.begin();
      while (labelsIt!=labels.end())
      {
        html+=*labelsIt ;
        ++labelsIt;
        if (labelsIt!=labels.end())
        {
          html+=", ";
        }
      }
      html+=(std::string)"</td>";
      html+="</tr>\r\n";
    }
  }

  html+="</table>\r\n";
}



enum INPUT_FORMAT
{
  INPUT_FORMAT_ORIC_XA,
  INPUT_FORMAT_ATARI_DEVPAC,
};


#define NB_ARG	4

int main(int argc,char *argv[])
{
  //
  // Some initialization for the common library
  //
  SetApplicationParameters(
    "MemMap",
    TOOL_VERSION_MAJOR,
    TOOL_VERSION_MINOR,
    "{ApplicationName} - Version {ApplicationVersion} - This program is a part of the OSDK (http://www.osdk.org)\r\n"
    "\r\n"
    "Author:\r\n"
    "  (c) 2002-2023 Pointier Mickael \r\n"
    "\r\n"
    "Usage:\r\n"
    "  {ApplicationName} [switches] <symbol_file> <output_html_file> <program_title> <css_file>\r\n"
    "\r\n"
    "Switches:\r\n"
    " -f   Format\r\n"
    "       -f0 => XA (Oric) [default]\r\n"
    "       -f1 => Devpac (Atari ST)\r\n"
    "\r\n"
    );


  INPUT_FORMAT inputFormat=INPUT_FORMAT_ORIC_XA;		// 0=XA / 1=Devpac

  ArgumentParser argumentParser(argc,argv);

  while (argumentParser.ProcessNextArgument())
  {
    if (argumentParser.IsSwitch("-f"))
    {
      //format: [-f]
      //	0 => XA (Oric)
      // 	1 => Devpac (Atari)
      inputFormat=(INPUT_FORMAT)argumentParser.GetIntegerValue(INPUT_FORMAT_ORIC_XA);
    }
  }


  if (argumentParser.GetParameterCount()!=NB_ARG)
  {
    ShowError(0);
  }


  //
  // Copy last parameters
  //
  std::string	source_name(argumentParser.GetParameter(0));
  std::string	dest_name(argumentParser.GetParameter(1));
  std::string	project_name(argumentParser.GetParameter(2));
  std::string	css_name(argumentParser.GetParameter(3));

  /*
  printf("\n0=%s\n",source_name.c_str());
  printf("\n1=%s\n",dest_name.c_str());
  printf("\n2=%s\n",project_name.c_str());
  printf("\n3=%s\n",css_name.c_str());
  */

  void* ptr_buffer_void;
  size_t size_buffer_src;

  //
  // Load the file
  //
  if (!LoadFile(source_name.c_str(),ptr_buffer_void,size_buffer_src))
  {
    printf("\nUnable to load file '%s'",source_name.c_str());
    printf("\n");
    exit(1);
  }

  unsigned char *ptr_buffer=(unsigned char*)ptr_buffer_void;

  //
  // Parse the file, and generate the list of values
  //
  std::map<std::string,Section>	sections;

  switch (inputFormat)
  {
  case INPUT_FORMAT_ORIC_XA:
    {
      Section& section_zeropage=sections["Zero"];
      section_zeropage.m_anchor_name	="Zero";
      section_zeropage.m_section_name	="Zero page";
      section_zeropage.m_adress_size	=2;
      section_zeropage.m_begin_adress	=0x0;
      section_zeropage.m_end_adress	=0xFF;

      Section& section_normal=sections["Normal"];
      section_normal.m_anchor_name	="Normal";
      section_normal.m_section_name	="Normal memory";
      section_normal.m_adress_size	=4;
      section_normal.m_begin_adress	=0x400;
      section_normal.m_end_adress		=0xBFFF;

      Section& section_overlay=sections["Overlay"];
      section_overlay.m_anchor_name	="Overlay";
      section_overlay.m_section_name	="Overlay memory";
      section_overlay.m_adress_size	=4;
      section_overlay.m_begin_adress	=0xC000;
      section_overlay.m_end_adress	=0xFFFF;
    }
    break;

  case INPUT_FORMAT_ATARI_DEVPAC:
    {
      Section& section_zeropage=sections["Text"];
      section_zeropage.m_anchor_name	="Text";
      section_zeropage.m_section_name	="Section TEXT";
      section_zeropage.m_adress_size	=4;
      section_zeropage.m_begin_adress	=0x00;
      section_zeropage.m_end_adress	=0xFFFFFF;

      Section& section_normal=sections["Data"];
      section_normal.m_anchor_name	="Data";
      section_normal.m_section_name	="Section DATA";
      section_normal.m_adress_size	=4;
      section_normal.m_begin_adress	=0x00;
      section_normal.m_end_adress		=0xFFFFFF;

      Section& section_overlay=sections["Bss"];
      section_overlay.m_anchor_name	="Bss";
      section_overlay.m_section_name	="Section BSS";
      section_overlay.m_adress_size	=4;
      section_overlay.m_begin_adress	=0x00;
      section_overlay.m_end_adress	=0xFFFFFF;

      Section& section_rs=sections["RS"];
      section_rs.m_anchor_name	="RS";
      section_rs.m_section_name	="RS offsets";
      section_rs.m_adress_size	=4;
      section_rs.m_begin_adress	=0x00;
      section_rs.m_end_adress	=0xFFFFFF;
    }
    break;
  }


  char *ptr_tok=strtok((char*)ptr_buffer," \r\n");
  while (ptr_tok)
  {
    // Address
    int value=strtol(ptr_tok,0,16);

    switch (inputFormat)
    {
    case INPUT_FORMAT_ORIC_XA:
      {
        ptr_tok=strtok(0," \r\n");
        // Name
        if (value<256)
        {
          // Zero page
          sections["Zero"].AddSymbol(value,ptr_tok);
        }
        else
          if (value>=0xc000)
          {
            // Overlay memory
            sections["Overlay"].AddSymbol(value,ptr_tok);
          }
          else
          {
            sections["Normal"].AddSymbol(value,ptr_tok);
          }
      }
      break;

    case INPUT_FORMAT_ATARI_DEVPAC:
      {
        // ptr_tok:
        // A=Absolute (rs/offsets/computations)
        // R=Relocatable (addresses)
        // T=TEXT
        // D=DATA
        // B=BSS
        std::string section="Text";

        std::string token;
        do
        {
          ptr_tok=strtok(0," \r\n");
          token=ptr_tok;
          if (token=="A")	      section="RS";
          else if (token=="B")	section="Bss";
          else if (token=="T")	section="Text";
          else if (token=="D")	section="Data";
        }
        while (token.size()==1);

        sections[section].AddSymbol(value,token);
      }
    }
    ptr_tok=strtok(0," \r\n");
  }


  //
  // Generate the html file
  //
  std::string html(gHtmlHeader);

  StringReplace(html,"{PageTitle}"	,project_name);
  StringReplace(html,"{CssLink}"	,css_name);

  html+="<table>\r\n";
  html+="<tr>\r\n";

  std::map<std::string,Section>::iterator it(sections.begin());
  while (it!=sections.end())
  {
    Section& section=it->second;
    if (section.HasData())
    {
      // We export the section data only if there is something
      html+="<td valign=top>\r\n";
      section.Generate(html);
      html+="</td>\r\n";
    }
    ++it;
  }

  html+="</tr>\r\n";
  html+="</table>\r\n";

  html=html+gHtmlFooter;

  if (!SaveFile(dest_name.c_str(),html.c_str(),html.size()))
  {
    printf("\nUnable to save file '%s'",source_name.c_str());
    printf("\n");
    exit(1);
  }

  //
  // Make some cleaning
  //
  free(ptr_buffer);

  return 0;
}


