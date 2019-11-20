// JavaScript Document


;
var ROOT_URL ='';
$(function(){
	
	var planetTravelConfig = {
		flyStarImage	: [ [ '/others/forExamHome/images/star-fly-1.png' , 23 ,23 ] ],
		flashStarImage	: [ [ '/others/forExamHome/images/star-flash-1.png' , 30 ,27 ] , [ '/others/forExamHome/images/star-flash-2.png' , 40 ,40 ], [ '/others/forExamHome/images/star-flash-2.png' , 40 ,40 ] ],
		flashStarDensity	: 0.3 	,
		flyMakeStarTime		: 5000 , 
		flyMakestarNum		: 2  	
	};
	
	if( '\v' == 'v' ){ /*如果是 IE6,7,8*/
		planetTravelConfig.flyMakeStarTime	=  8000 ; 
		planetTravelConfig.flyMakestarNum	=  1 
	} 
	
	$('body').planetTravel(planetTravelConfig);	
/*	if(is_home){
		$('body').css({'overflow':'hidden'});
	}*/
	
	
	julying.gridMenu.menu = Array(		
		{ name : 'quick' ,  	pos : rand( 1 , 10 )  },
		{ name : 'contact-me' , pos : rand( 75 ,80 )  },
		{ name : 'examHistory' ,  		pos : rand( 30 , 40 )  },
		{ name : 'selectExam' , 		pos : rand( 15 , 25 ) },
		{ name : 'studentManage' , 		pos : rand( 40 , 50 ) },
		{ name : 'paperManage' , 		pos : rand( 50 , 60 ) },
		{ name : 'questionManage' , 	pos : rand( 65 , 75 ) }
	);
	julying.gridMenu.init('#julyingGridMenu') ;
	$('strong[name=replace]').each(function(){
		$(this).html( $(this).attr('val'));
	});
	
});
