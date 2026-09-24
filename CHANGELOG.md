# Changelog

All notable changes to dnf-example are documented here.  
Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]


## [0.3.0] - 2026-09-24

### ⚠ Breaking

- **machines**: Split usr/machines by provenance

### Added

- **alerts**: Example module for declarative alert silences
- **matrix**: Mandatory MAS and declarative network.matrix.admins

### Fixed

- **alerts**: One disk alert per partition, with its mountpoints
- **config**: Migrate to current framework profiles and services

### Removed

- **host**: Drop options moved to the home-manager namespace

### Changed

- Default.just split
- Git + src -> dev.just
- **just**: Import dnf/just/project.just

### Documentation

- **flake**: Document the pinned-release model and the upgrade path
- **config**: Add commented fleetUpdate example

### Dependencies

- dnf v0.3.0

[Unreleased]: https://github.com/darkone-linux/dnf-example/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/darkone-linux/dnf-example/releases/tag/v0.3.0
