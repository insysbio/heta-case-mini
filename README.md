[![Heta project](https://img.shields.io/badge/%CD%B1-Heta_project-blue)](https://hetalang.github.io/)
[![GH Build](https://github.com/insysbio/heta-case-mini/workflows/Build/badge.svg)](https://github.com/insysbio/heta-case-mini/actions?query=workflow%3ABuild)
[![Build and Share](https://github.com/insysbio/heta-case-mini/workflows/Build%20and%20Share/badge.svg)](https://github.com/insysbio/heta-case-mini/actions?query=workflow%3A%22Build+and+Share%22)
[![gh-pages](https://img.shields.io/badge/gh.pages-ready-blue.svg)](https://insysbio.github.io/heta-case-mini/)
[![gh-pages](https://img.shields.io/badge/SbmlViewer-ready-blue.svg)](http://sv.insysbio.com/online/?https://insysbio.github.io/heta-case-mini/sbml.xml)
[![GitHub license](https://img.shields.io/github/license/insysbio/heta-case-mini.svg)](https://github.com/insysbio/heta-case-mini/blob/master/LICENSE)

# heta-case-mini

*This is part of [heta-lang](https://hetalang.github.io/) project.*

This repository is a demo example of QSP platfrom developed with Heta compiler.

## Continuous integration solutions

The repository includes the example of settings for CI/CD. See files: `.github/workflows/build.yml`, `.github/workflows/build-and-share.yml` for GH Actions,  `.travis.yml` for Travis, `appveyor.yml` for Appveyor.

The result of integration can be found on GitHub Pages <https://insysbio.github.io/heta-case-mini/>

### Short description of CI/CD steps for GH Actions: linux, osx, windows
 - [Heta compiler](https://hetalang.github.io/#/heta-compiler/) installation
 - platform bulding: generation of export files
 - mrgsolve installation
 - running R scripts to generate plots (only for **master** branch and **linux**)
 - sending files to gh-pages (only for **master** branch and **linux**)

## Directory structure

`/src` : Source files. Main folder for storing modeling and data files.

`/src/index.heta` : Platform content in Heta syntax.

`/platform.json` : main platform settings.

`/R` : files to store .R code for creating diagnostic plot.

`/static` : files required for creation github pages.

`/.travis.yml` : settings for CI/CD in <https://travis-ci.org/> (currently not used)

`/appveyor.yml` : settings for CI/CD in <https://www.appveyor.com/> (currently not used)

There is a set of directories generated dynamically but not syncronized with master: `dist`, `meta`.
