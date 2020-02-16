get '/images/:project/:img' do
  send_file open(ProjectPhotos.serve_file(params), type: 'image/jpeg', disposition: 'inline')
end