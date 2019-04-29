let g:airline#themes#mytheme#palette = {}

let s:guibg = '#080808'
let s:termbg = 232
let s:termbgm = 236
let s:termsep = 236
let s:guisep = '#303030'

let s:N1 = [ '#00dfff' , s:guibg , 153 , s:termbg  ]
let s:N2 = [ '#ff5f00' , s:guibg , 147 , s:termbg  ]
let s:N3 = [ '#767676' , s:guibg , 121 , s:termbgm ]

let g:airline#themes#mytheme#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#mytheme#palette.normal_modified = {
      \ 'airline_c': [ '#df0000' , s:guibg, 161     , s:termbgm    , ''     ] ,
      \ }

let s:I1 = [ '#5fff00' , s:guibg , 84  , s:termbg  ]
let s:I2 = [ '#ff5f00' , s:guibg , 123 , s:termbg  ]
let s:I3 = [ '#767676' , s:guibg , 121 , s:termbgm ]
let g:airline#themes#mytheme#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#mytheme#palette.insert_modified = copy(g:airline#themes#mytheme#palette.normal_modified)
let g:airline#themes#mytheme#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 172     , ''     ] ,
      \ }

let s:R1 = [ '#5fff00' , s:guibg , 161 , s:termbg  ]
let s:R2 = [ '#ff5f00' , s:guibg , 123 , s:termbg  ]
let s:R3 = [ '#767676' , s:guibg , 121 , s:termbgm ]
let g:airline#themes#mytheme#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
" let g:airline#themes#mytheme#palette.replace = {
"       \ 'airline_a': [ s:I1[0]   , 161 , s:I1[2] , 124     , ''     ] ,
"       \ }
let g:airline#themes#mytheme#palette.replace_modified = copy(g:airline#themes#mytheme#palette.normal_modified)

let s:V1 = [ '#dfdf00' , s:guibg , 184 , s:termbg  ]
let s:V2 = [ '#ff5f00' , s:guibg , 202 , s:termbg  ]
let s:V3 = [ '#767676' , s:guibg , 121 , s:termbgm ]
let g:airline#themes#mytheme#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#mytheme#palette.visual_modified = copy(g:airline#themes#mytheme#palette.normal_modified)

let s:IA  = [ '#4e4e4e' , s:guibg  , 239 , s:termbg  , '' ]
let s:IA2 = [ '#4e4e4e' , s:guisep , 239 , s:termsep , '' ]
let g:airline#themes#mytheme#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA2, s:IA2)
let g:airline#themes#mytheme#palette.inactive_modified = copy(g:airline#themes#mytheme#palette.normal_modified)

