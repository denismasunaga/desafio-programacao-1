# Execução:

Para rodar o teste siga os seguintes passos:

Primeiramente, certifique-se que a versão que está utilizando o ruby seja a 2.5.3.
Após isso faça:

git clone https://github.com/denismasunaga/desafio-programacao-1
bundle install
bundle exec rake db:migrate

Por motivos de segurança, removi a chave e a id do facebook. Essas podem ser obtidas em developers.facebook.com. Basta criar um aplicativo novo do tipo "Integrar Login do Facebook" para obter a chave e a id. Feito isso adicione o id do app no lugar da string 'app_id' e a chave no lugar da string 'app_secret' em app/app.rb na linha 25:

  provider :facebook, 'app_id', 'app_secret', provider_ignores_state: true

padrino s

Em um browser digite:

localhost:3000/

# Tecnologias:

Foi utilizado o framework ruby Padrino que é construído tendo o Sinatra como base. Trata-se de um framework mais completo que o Sinatra, porém mais enxuto que o Rails.
Para o banco foi utilizado o SQLite por não necessitar de configuração adicional ao ser instalado em um novo ambiente.
Para o OAuth foi utilizado o omniauth que implementa o OAuth2 enter outros protocolos.
