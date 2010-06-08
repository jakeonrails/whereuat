module UatDirector
  module Helpers
    def uat_director
<<TDSCRIPT
<script type="text/javascript">
  $("body").prepend("#{toolbar_html}");
  $("head").append("<link href='http://github.com/plus2/uat_director/raw/master/lib/uat_director/stylesheets/uat_director.css' media='screen' rel='stylesheet' type='text/css'>");
  $(function() {
    $("#uat-bar a.go").click(function() {
      $.ajax({
        url: '/uat_director',
        success: function(response) {
          $(".pop-over").append(response); 
          $(".pop-over").slideDown();
        }
      });
    });

    $("#uat-bar a.close").click(function() {
      $(".pop-over").slideUp(function() {
        $(".pop-over ol").remove();
      });
    });
  });
</script>
TDSCRIPT
    end

    def toolbar_html
      "<div id='uat-bar'><a class='go' href='#'>Show me what to test</a><div class='pop-over hide'><a class='close' href='#'>close</a></div></div>"
    end
  end
end
