enum dir_directions{
	left,
	right,
	bottom,
	top,
	top_left,
	top_right,
	bottom_left,
	bottom_right
}

function scr_write_text_Shadow(font , fa_halign ,fa_valign , x , y , text , color , HowFarShadowGoes , dir_direction){
	draw_set_font(font);
	draw_set_halign(fa_halign);
	draw_set_valign(fa_valign);
	switch(dir_direction){
		case dir_directions.left: 
			draw_text_transformed_color(x-HowFarShadowGoes,y,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.right: 
			draw_text_transformed_color(x+HowFarShadowGoes,y,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.bottom: 
			draw_text_transformed_color(x,y+HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.top: 
			draw_text_transformed_color(x,y-HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.top_left: 
			draw_text_transformed_color(x-HowFarShadowGoes,y-HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.top_right: 
			draw_text_transformed_color(x+HowFarShadowGoes,y-HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.bottom_left: 
			draw_text_transformed_color(x-HowFarShadowGoes,y+HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
		case dir_directions.bottom_right: 
			draw_text_transformed_color(x+HowFarShadowGoes,y+HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
		break;
	}
	draw_text_transformed_color(x+HowFarShadowGoes,y+HowFarShadowGoes,text,1,1,0,c_black,c_black,c_black,c_black,0.2);
	draw_text_transformed_color(x,y,text,1,1,0,color,color,color,color,1);
}

function scr_write_text_outline(font , fa_Valign ,fa_Halign , x , y , text , textcolor ,outlinecolor , outlineSize ){
	draw_set_font(font);
	draw_set_halign(fa_Halign);
	draw_set_valign(fa_Valign);
	
	//Outline  
	draw_set_color(outlinecolor);  
	draw_text(x+outlineSize, y+outlineSize, text);  
	draw_text(x-outlineSize, y-outlineSize, text);  
	draw_text(x,   y+outlineSize, text);  
	draw_text(x+outlineSize,   y, text);  
	draw_text(x,   y-outlineSize, text);  
	draw_text(x-outlineSize,   y, text);  
	draw_text(x-outlineSize, y+outlineSize, text);  
	draw_text(x+outlineSize, y-outlineSize, text); 
	draw_text_transformed_color(x,y,text,1,1,0,textcolor , textcolor,textcolor,textcolor,1);
	
}

function scr_write_text_outline_with_scale(font , fa_Valign,fa_Halign , x , y , text , textcolor ,outlinecolor , outlineSize , xscale , yscale ){
	draw_set_font(font);
	draw_set_halign(fa_Halign);
	draw_set_valign(fa_Valign);
	
	//Outline  
	draw_set_color(outlinecolor);  
	draw_text_transformed_color(x+outlineSize, y+outlineSize, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x-outlineSize, y-outlineSize, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x,   y+outlineSize, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x+outlineSize,   y, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x,   y-outlineSize, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x-outlineSize,   y, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x-outlineSize, y+outlineSize, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1);  
	draw_text_transformed_color(x+outlineSize, y-outlineSize, text,xscale,yscale,0,outlinecolor , outlinecolor,outlinecolor,outlinecolor,1); 
	draw_text_transformed_color(x,y,text,xscale,yscale,0,textcolor , textcolor,textcolor,textcolor,1);
	
}