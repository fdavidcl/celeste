# Instrucciones

## Instalación (una sola vez)

### Ruby (opcional)

Para utilizar las bibliotecas ya incluidas en el programa es necesario usar la versión 2.3.0 de Ruby o superior. Para instalarla, se puede utilizar EVM de la siguiente manera:

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

Ejecutar la siguiente instrucción (si es necesario, usar `sudo`):

```
gem install bundler
```

Si la versión de Ruby que estamos usando (comprobar `ruby --version`) es inferior a la 2.3.0, entonces además ejecutaremos

```
bundle install
```

para descargar las dependencias restantes.

## Uso

Ejecutar `bundle exec main.rb <t>` donde `<t>` es el tiempo en días. El programa
devolverá en consola la posición de los planetas tras ese número de días 
transcurridos desde la posición inicial (en la rama positiva del eje X). Además, 
generará dos archivos HTML, `inner.html` y `outer.html` con gráficos 
interactivos para las órbitas de los planetas del círculo interno y externo del 
Sistema Solar, respectivamente.
