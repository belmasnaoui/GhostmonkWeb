( function( $ )
{
    var cursor;
    var navlist;
    
    $.fn.enableNav = function()
    {
        navList = $( '#Navigation ul' );
        navList.prepend( '<div id="navCursor"></div>' );
        cursor = $( "#Navigation ul #navCursor" );
        navList.mouseleave( onMouseLeave );
        navList.mouseenter( onMouseEnter );
        $( '#Navigation ul li' ).mouseenter( onMouseEnterListItem );
        onMouseLeave();
    }

    var onMouseEnter = function( e )
    {
        cursor.fadeIn();
    }

    var onMouseEnterListItem = function( e )
    {
        cursor.stop( true, true).animate( { left:this.offsetLeft, width:$( this ).width() + 20 }, 250 );    
    }

    var onMouseLeave = function( e )
    {
        dest = $( "#Navigation ul li.current" );
        cursor.stop( true, true).animate( { left:dest.offset().left, width:dest.width() + 20 }, 250 );
    }
})( jQuery );

( function( $ ) 
{
    $.fn.enableSocialLinks = function()
    {
        $( '#SocialMedia ul li a' ).mouseenter( onMouseEnter );
        $( '#SocialMedia ul li a' ).mouseleave( onMouseLeave );
    }

    var onMouseEnter = function( e )
    {
        var overImg = $( this ).find( "img.active" );
        var outImg = $( this ).find( "img.inactive" );
        overImg.stop( true, true).fadeTo( 0, 1 );
        outImg.stop( true, true).fadeTo( 500, 0 );
    }

    var onMouseLeave = function( e )
    {
        var overImg = $( this ).find( "img.active" );
        var outImg = $( this ).find( "img.inactive" );
        outImg.stop( true, true).fadeTo( 500, 1, function()
        {
            overImg.fadeTo( 0, 1 );
        });
    }
})( jQuery );