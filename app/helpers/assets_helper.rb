module AssetsHelper
  def version_picker(elm, chosen = nil)
    select_tag "asset_version_#{elm.original_id}", options_for_select(1..elm.max_version, chosen), class: 'version-navigator'
  end
end