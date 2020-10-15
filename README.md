[![Heta project](https://img.shields.io/badge/%CD%B1-Heta_project-blue)](https://hetalang.github.io/)
[![GH Actions](https://github.com/insysbio/heta-case-mini/workflows/Build%20and%20Share/badge.svg)](https://github.com/insysbio/heta-case-mini/actions?query=workflow%3A%22Build+and+Share%22)
[![Travis](https://travis-ci.org/insysbio/heta-case-mini.svg?branch=master)](https://travis-ci.org/insysbio/heta-case-mini)
[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/insysbio/heta-case-mini?branch=master&svg=true)](https://ci.appveyor.com/project/metelkin/heta-case-mini)
[![gh-pages](https://img.shields.io/badge/gh.pages-ready-blue.svg)](https://insysbio.github.io/heta-case-mini/)
[![gh-pages](https://img.shields.io/badge/SbmlViewer-ready-blue.svg)](http://sv.insysbio.com/online/?https://insysbio.github.io/heta-case-mini/sbml.xml)
[![GitHub license](https://img.shields.io/github/license/insysbio/heta-case-mini.svg)](https://github.com/insysbio/heta-case-mini/blob/master/LICENSE)

# heta-case-mini

*This is part of [heta-lang](https://hetalang.github.io/) project.*

This repository is a demo example of QSP platfrom developed with Heta compiler.

## Continuous integration solutions

The repository includes the example of settings for CI/CD. See files: `.github/workflows/build-and share.yml` for GH Actions,  `.travis.yml` for Travis, and `appveyor.yml` for Appveyor.

The result of integration can be found on GitHub Pages <https://insysbio.github.io/heta-case-mini/>

### Short description of CI/CD steps for Travis: linux, osx, windows
 - [Heta compiler](https://hetalang.github.io/#/heta-compiler/) installation
 - platform bulding: generation of export files
 - mrgsolve installation
 - running R scripts to generate plots
 - sending files to gh-pages (only for **master** branch and **linux**)

## Directory structure

`/src` : Source files. Main folder for storing modeling and data files.

`/src/index.heta` : Platform content in Heta syntax.

`/platform.json` : main platform settings.

`/R` : files to store .R code. Used for creating diagnostic plot.

`/static` : files required for creation github pages.

`/.travis.yml` : settings for CI/CD in <https://travis-ci.org/>

`/appveyor.yml` : settings for CI/CD in <https://www.appveyor.com/>

There is a set of directories generated dynamically but not syncronized with master: `dist`, `tmp`, `meta`.

## Known issues

 - Appveyor cannot finish successfully because of warnings in one of Heta compiler dependencies. 