// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
    jQuery('div.menu_item a').click(function() {
        jQuery(this).siblings('div.feedback').show();
    });

    jQuery('div.feedback').bind('success', function() {
        var message = jQuery('<p>').attr('class', 'success').text('Thanks for your feedback!');
        jQuery(this).find('p').after(message);
    });
});