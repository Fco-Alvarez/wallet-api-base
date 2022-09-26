![image](https://user-images.githubusercontent.com/56528396/154179983-2317c03c-9a74-4c4f-8fc5-b07ef972c470.png)

# Proyecto Wallet | Ruby on Rails
Template base para crear una API de una wallet

## Primeros pasos

Este repositorio contiene una plantilla base, la cual contiene toda la configuración básica para comenzar a crear las diferentes features.

Deberas un repositorio nuevo usando esta [template como base](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
A partir del archivo **.env.sample** Deberas crear un archivo llamado **.env**, el cual contendrá las configuraciones generales del proyecto. Es importante crear un archivo nuevo **.env** y no renombrar el archivo **.env.sample** para que este quede disponible como modelo inicial.


## Workflow GIT(Conventional Commits)

A la hora de crear `branches` y `commits` vamos a estar usando la convención de [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

## Comandos básicos Rubocop

Rubocop es un [Lint](https://es.wikipedia.org/wiki/Lint), el cual no ayuda a mejorar la calidad y la prolijidad en la sintaxis
de nuestro código. Podemos ejecutar en nuestra terminal el comando `bundle exec rubocop` para detectar la `offenses` o errores
de sintaxis que no cumple con las convenciones de Ruby, Rails y RSpec.


## Comando básicos para test(RSpec)

Aunque por defecto Ruby on Rails nos ofrece `Minitest` como framework de testing por defecto, vamos a utilizar `Rspec` como
framework de pruebas en este proyecto. A continuación tenemos una lista de los comandos más habituales:

* Comando por defecto para ejecutar TODOS los specs: `bundle exec rspec`

* Comando para ejecutar los specs de un directorio: `bundle exec rspec spec/models`

* Comando para ejecutar specs de un archivo: `bundle exec rspec spec/controllers/accounts_controller_spec.rb`

* Comando para ejecutar un solo example dentro de un archivo:
  `bundle exec rspec spec/controllers/accounts_controller_spec.rb:8`

## Gemas instaladas en la template base

Este es listado de gemas agregadas al proyecto, se recomienda explorar cada una para entender que usos le podemos dar en nuestro proyecto.

* [dotenv](https://github.com/bkeepers/dotenv)
* [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
* [pry-rails](https://github.com/pry/pry-rails)
* [annotate](https://github.com/ctran/annotate_models)
* [brakeman](https://github.com/presidentbeef/brakeman)
* [rails_best_practices](https://github.com/flyerhzm/rails_best_practices)
* [rubocop](https://github.com/rubocop/rubocop)
* [rubocop-performance](https://docs.rubocop.org/rubocop-performance/index.html)
* [rubocop-rails](https://docs.rubocop.org/rubocop-performance/index.html)
* [rubocop-rspec](https://github.com/rubocop/rubocop-rspec)
* [faker](https://github.com/faker-ruby/faker)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)