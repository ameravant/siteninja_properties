function initMultiField() {
	var num = parseInt(jQuery(".add-images input:last").attr("id").replace(/^\D+/i, "").replace(/_\D+$/i, "")) + 1;
	var obj = jQuery(".add-images input:last").attr("id").replace(/_images.*$/i, "");
	var address = jQuery("span.hidden-for-js").text();
	jQuery(".add-new-image").click(function() {
		var new_input = "<div class=\"img-form\" style=\"margin-left:7.3em;\"><span><label for=\"" + obj + "_images_attributes_" + num + "_title\">Title</label> <input id=\"" + obj + "_images_attributes_" + num + "_title\" name=\"" + obj + "[images_attributes][" + num + "][title]\" size=\"30\" type=\"text\" value=\"" + address + "\" /> <label for=\"" + obj + "_images_attributes_" + num + "_title\">Image</label><input id=\"" + obj + "_images_attributes_" + num + "_image\" name=\"" + obj + "[images_attributes][" + num + "][image]\" size=\"30\" type=\"file\" /></span></div>"
		jQuery(".add-images").prepend(new_input);
		num += 1;
		// append("<input id=\"property_images_attributes_" + num +"_id\" name=\"property[images_attributes][" + num + "][id]\" type=\"hidden\" value=\"1\" /><input id=\"property_images_attributes_" + num + "_title\" name=\"property[images_attributes][" + num + "][title]\" size=\"30\" type=\"text\" value=\"\" /> <input id=\"property_images_attributes_" + num + "_image\" name=\"property[images_attributes][" + num + "][image]\" size=\"30\" type=\"file\" /> <a href=\"#\" class=\"remove\">Remove</a>");
		return false;
	});
	jQuery("a.remove-image").click(function() {
		jQuery(this).parent(".img-form").remove();
		return false;
	});
}
jQuery(document).ready(function () {
	initMultiField();
});

