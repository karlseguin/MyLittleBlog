(function($)
{
    $.fn.charCount = function(command)
    {
        if (command == 'reset')
        {
            return this.each(function()
            {
                this.charCount.updateCount();
            });
        }
        return this.each(function()
        {
            if (this.maxlength) { return false; }
            var $this = $(this);
            var c =
            {
                $container: null,
                initialize: function()
                {
                    $container = $('.charCounter', $this.parent().parent());
                    $this.keyup(function()
                    {
                        c.updateCount();
                    });
                    c.updateCount();
                },
                updateCount: function()
                {
                    $container.html($this.val().length + " / " + command);
                }
            }
            this.charCount = c;
            c.initialize();
    });
};
})(jQuery);