<script>
function get_pagination_content_display(str) {
	$('pagination_content').update(unescape(str));
	}	
function get_page(page) {
	majax.get("info/ctree_content.asp?X="+page,get_pagination_content_display);
	}
function info_display(str) {
	$('info_content').update(unescape(str));
	}	
function display(k) {
	majax.get("info/display.asp?K="+k,info_display);
	}
</script>
	
<div id="info_content"></div>
<br/>
<div id="pagination_content"></div>

<script>
get_page(0);
</script>
