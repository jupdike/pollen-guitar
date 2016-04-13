# pollen-guitar

Make guitar lead sheets easily with beautiful HTML output, using [Pollen](http://docs.racket-lang.org/pollen/).

## Some notes for myself:

### Install pollen

    brew install pollen
    raco pkg install pollen

### Update racket packages from command-line:

    raco pkg update --update-deps pollen

### Render

    raco pollen render guitar-sdmpwc.html.pm

### Start webserver

    raco pollen start . 8088

