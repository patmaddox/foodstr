// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
    jQuery('div.menu_item a').click(function() {
        jQuery(this).siblings('div.feedback').toggle();
    });

    jQuery('div.feedback').bind('success', function() {
        jQuery(this).find('p.response').addClass('success').text('Thanks for your feedback!').show().fadeOut(5000);
    });
});