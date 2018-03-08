module ApplicationHelper
  # 必填项，红星
  def require_span
    "<span class='red'>* </span>".html_safe
  end

  # 按钮下拉方式展示
  def operate_buttons(object, options = {}, &block)
    return "" if object.blank?
    lis = ""
    if object.is_a?(Array)
      if object.size == 1
        return object[0].gsub("<a", "<a class='btn btn-primary btn-sm'").html_safe
      end
      lis = object.map{|link| "<li>#{link}</li>" }.join("")
    elsif object.present?
      options[:namespace] = "ancient" if options[:namespace].nil?
      namespace = options[:namespace]
      links = []
      edit_path = eval("#{['edit', namespace, object.class.to_s.tableize.singularize, 'path'].compact.join('_')}(#{object.id},:back => request.fullpath)")
      destroy_path = eval("#{[namespace, object.class.to_s.tableize.singularize, 'path'].compact.join('_')}(#{object.id},:back => request.fullpath)")

      links << link_to('修改', edit_path)
      links << link_to('删除', destroy_path, :method => 'delete', :confirm =>'您确定吗？')
      links += options[:links] if options[:links].present?
      lis = links.map{|link| "<li>#{link}</li>" }.join("")
      if block_given?
        lis << capture(&block)
      end
    end
    html = %Q|
      <div class="btn-group">
        <button class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">操作<span class="caret"></span></button>
        <ul class="dropdown-menu #{options[:ul_class]}">
          #{lis}
        </ul>
      </div>
    |.html_safe
  end
end
