module DocumentsHelper
  def download_file_path(file_name)
    if File.exist?(Rails.root.join("public", "download_files", file_name))
      "/download_files/#{file_name}"
    end
  end
end
