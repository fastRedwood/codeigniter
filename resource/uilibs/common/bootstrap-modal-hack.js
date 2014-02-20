define(function(require, exports, module) {

    $(function(options) {

        $(document).on('click', '[data-toggle=modal]', function(e) {
            var url = $(this).data('url');
            if (url) {
                $($(this).attr('data-target')).html('').load(url);
            }
        });

        // $('#myModal').modal(options)

        // $('.modal').on('click', '[data-toggle=form-submit]', function(e) {
        //     e.preventDefault();
        //     $($(this).data('target')).submit();
        // });

        // $(".modal").on('click', '.pagination a', function(e){
        //     e.preventDefault();
        //     var $modal = $(e.delegateTarget);
        //     $.get($(this).attr('href'), function(html){
        //         $modal.html(html);
        //     });
        // });

    });

});