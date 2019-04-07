Desafio::App.controllers :main do

  get :sales, :map => '/sales' do
    render 'index.html.erb'
  end

  post :upload, :map => '/sales/upload' do

    if !(params[:file] &&
        (tmpfile = params[:file][:tempfile]) &&
        (params[:file][:filename]))
      "Nenhum arquivo foi selecionado!"
    else
      total = create_sale(tmpfile)
    end

    "Receita bruta total: #{total}"
  end

end
