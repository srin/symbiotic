$(document).ready(function() {
$('.activeitem a').each(function() {
// IS this the active link?
if ($(this).attr('href') == $(location).attr('pathname'))
$(this).parent().addClass("active")
})
})


$(document).ready(function() {
$('.catitem a').each(function() {
// IS this the active link?
if ($(this).attr('href') == $(location).attr('pathname'))
$(this).parent().addClass("active")
})
})
