/*  Author:  */

;
(function (admin, $) {
    admin.cookiePolicy = function () {
        console.debug('admin.cookiePolicy is running');
        /**
         * Test if user has been to site before and accepted cookies
         * If so, keep message hidden
         * If not, keep visible and allow user to accept
         */

        var $cookiePolicyEl = $('.cookiePolicy');

        if (admin.cookies.getItem('cookies-agreed') !== 'true') {
            $cookiePolicyEl.removeClass('is-hidden');

            $('.agreeBtn').on('click', function (event) {
                event.preventDefault();
                admin.cookies.setItem('cookies-agreed', 'true');
                $cookiePolicyEl.remove();
            });
        }
    };
})(window.admin = window.admin || {}, jQuery);
