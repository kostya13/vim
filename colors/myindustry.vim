" Vim color file
" Maintainer:	Shian Lee 
" Last Change:	2014 Mar 6 (for vim 7.4)
" Remark:	"industry" stands for 'industrial' color scheme. In industrial
"		HMI (Human-Machine-Interface) programming, using a standard color
"               scheme is mandatory in many cases (in traffic-lights for example): 
"               LIGHT_RED is	    'Warning' 
"               LIGHT_YELLOW is	    'Attention' 
"               LIGHT_GREEN is	    'Normal' 
"               LIGHT_MAGENTA is    'Warning-Attention' (light RED-YELLOW)
"               LIGHT_CYAN is	    'Attention-Normal'  (light YELLOW-GREEN).
"               BLACK is	    Dark-High-Contrast Background for maximum safety.
"               BLUE is		    Shade of BLACK (not supposed to get attention).
"
"               Industrial color scheme is by nature clear, safe and productive. 
"               Yet, depends on the file type's syntax, it might appear incorrect. 

" Reset to dark background, then reset everything to defaults:
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "myindustry"

hi Normal ctermfg=DarkGreen ctermbg=Black guifg=#dddddd	guibg=Black

hi Comment    cterm=NONE ctermfg=DarkGray    	gui=NONE guifg=#00aaaa   	 
hi Number     cterm=NONE ctermfg=DarkGreen   	gui=NONE guifg=#00ffff   	
hi Constant   cterm=NONE ctermfg=DarkGreen   	gui=NONE guifg=#00ffff   	
hi Identifier cterm=NONE ctermfg=White          gui=NONE guifg=#ff00ff   
hi Function   cterm=NONE ctermfg=DarkGreen   	gui=NONE guifg=#00ff00   	
hi Statement  cterm=NONE ctermfg=Green	     	gui=bold guifg=#ffffff	     	
hi PreProc    cterm=NONE ctermfg=Green		    gui=NONE guifg=#ffff00 	
hi Type	      cterm=NONE ctermfg=DarkCyan	    gui=bold guifg=#00ff00 		
hi Special    cterm=NONE ctermfg=DarkGreen    	gui=NONE guifg=#ff0000    	
hi Delimiter  cterm=NONE ctermfg=White    	    gui=NONE guifg=#ffff00    	
hi Pmenu      cterm=NONE ctermfg=White ctermbg=DarkGray   	gui=NONE guifg=#ffff00    	
hi PmenuSel   cterm=NONE ctermfg=White       	gui=NONE guifg=#ffff00    	
