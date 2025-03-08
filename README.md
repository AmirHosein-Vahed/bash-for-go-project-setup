# Go Project Setup Script

A bash script that automatically generates a standardized Go project structure following modern best practices and conventional layout patterns.

## Features

### 📁 Directory Structure
The script creates a comprehensive project structure with the following directories:

```
.
├── api/            # API definitions (proto files, OpenAPI/Swagger specs)
├── build/          # Build and CI/CD related files
├── cmd/            # Main applications
├── configs/        # Configuration files
│   ├── development/
│   └── production/
├── deployments/    # Deployment configurations (docker, k8s, etc.)
├── docs/          # Documentation
├── examples/      # Examples and tutorials
├── init/          # System init/setup scripts
├── internal/      # Private application and library code
├── pkg/           # Public library code
├── scripts/       # Scripts for development
├── test/          # Additional test applications and test data
├── tools/         # Development tools
└── web/          # Web specific components
```

### 📦 Generated Files
The script automatically creates several essential files:

1. **Go Files**
   - `cmd/<project-name>/main.go`: Basic entry point with a hello world program
   - `internal/app/app.go`: Initial application structure
   - `go.mod`: Go module definition

2. **Project Files**
   - `Makefile`: Common development commands
   - `LICENSE`: MIT license
   - `.gitignore`: Pre-configured for Go projects
   - `README.md`: Project documentation template
   - `configs/development/config.yaml`: Development configuration
   - `configs/production/config.yaml`: Production configuration

### 🛠 Development Tools
The generated Makefile includes common commands:
- `make build`: Builds the application
- `make clean`: Removes build artifacts
- `make test`: Runs tests
- `make run`: Runs the application

## Requirements

- Bash shell
- Go 1.21 or higher
- Git (optional, but recommended)

## Installation

1. Download the script:
```bash
curl -O https://raw.githubusercontent.com/yourusername/go-project-setup/main/go-project-setup.sh
```

2. Make it executable:
```bash
chmod +x go-project-setup.sh
```

## Usage

1. Create a new project:
```bash
./go-project-setup.sh <project-name>
```

2. Navigate to your project:
```bash
cd <project-name>
```

3. Initialize git repository (optional):
```bash
git init
```

4. Run the project:
```bash
make run
```

### Example
```bash
./go-project-setup.sh myawesome-api
cd myawesome-api
go mod tidy
make run
```

## Project Structure Details

### `/cmd`
Main applications for this project. Each application's directory name should match the name of the executable (e.g., `/cmd/myapp`).

### `/internal`
Private application and library code. This directory is specific to your application and can't be imported by other projects.

### `/pkg`
Library code that's safe to use by external applications (e.g., `/pkg/mypubliclib`).

### `/api`
OpenAPI/Swagger specs, JSON schema files, protocol definition files.

### `/web`
Web application specific components: static web assets, server side templates, SPAs.

### `/configs`
Configuration file templates or default configs.

### `/init`
System init (systemd, upstart, sysv) and process manager/supervisor (runit, supervisord) configs.

### `/scripts`
Scripts to perform various build, install, analysis, etc. operations.

### `/build`
Packaging and Continuous Integration files.

### `/deployments`
IaaS, PaaS, system and container orchestration deployment configurations and templates.

### `/test`
Additional external test apps and test data.

### `/docs`
Design and user documents.

### `/tools`
Supporting tools for this project.

### `/examples`
Examples for your applications and/or public libraries.

## Customization

You can modify the script to:
1. Add more directories
2. Change the license type
3. Add custom templates
4. Modify the Makefile targets
5. Add additional configuration files

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Standard Go Project Layout](https://github.com/golang-standards/project-layout)
- [Go Best Practices](https://golang.org/doc/effective_go) 