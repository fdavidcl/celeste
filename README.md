# celeste.fdavidcl.me

## Autores
David Charte, José Luis Marqués, Almudena Gálvez

# Instrucciones

## Instalación (una sola vez)

### Ruby (opcional)

Para utilizar el programa es necesario usar la versión 2.3.0 de Ruby o superior. Para instalarla, se puede utilizar RVM de la siguiente manera:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1
rvm use 2.3.1
```

### Bibliotecas: GNU Scientific Library

Para instalar la GSL en Ubuntu, ejecutar:

```
sudo apt-get install libgsl0-dev
```

### Dependencias de Ruby: Bundler

Ejecutar las siguientes instrucciones (si es necesario, usar `sudo`):

```
gem install bundler
bundle install
```

## Uso

Ejecutar `ruby app.rb` y acceder con el navegador a `localhost:8080`.
