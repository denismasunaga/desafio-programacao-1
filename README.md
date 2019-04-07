# Execução:

Para rodar o teste siga os seguintes passos:

Primeiramente, certifique-se que a versão que está utilizando o ruby seja a 2.5.3.
Após isso faça:

git clone https://github.com/denismasunaga/desafio-programacao-1
bundle install
bundle exec rake db:migrate
padrino s

Em um browser digite:

localhost:3000/

# Tecnologias:

Foi utilizado o framework ruby Padrino que é construído tendo o Sinatra como base. Trata-se de um framework mais completo que o Sinatra, porém mais enxuto que o Rails.
Para o banco foi utilizado o SQLite por não necessitar de configuração adicional ao ser instalado em um novo ambiente.
Para o OAuth foi utilizado o omniauth que implementa o OAuth2 enter outros protocolos.
