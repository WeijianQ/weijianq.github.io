$(document).ready(function() {
    // Initialize Bootstrap popovers for annotation badges
    if (typeof $ !== 'undefined' && typeof $.fn.popover === 'function') {
        // Initialize for existing elements
        $('[data-toggle="popover"]').popover({
            trigger: 'hover focus',
            container: 'body'
        });
        // Defensive: re-init on dynamically added content
        $(document).on('mouseenter focus', '[data-toggle="popover"]', function() {
            if (!$(this).data('bs.popover')) {
                $(this).popover({ trigger: 'hover focus', container: 'body' }).popover('show');
            }
        });
    }

    $('a.abstract').click(function() {
        $(this).parent().parent().find(".abstract.hidden").toggleClass('open');
    });
    $('a.bibtex').click(function() {
        $(this).parent().parent().find(".bibtex.hidden").toggleClass('open');
    });
    $('.navbar-nav').find('a').removeClass('waves-effect waves-light');
});
