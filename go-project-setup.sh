#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if project name is provided
if [ $# -eq 0 ]; then
    echo -e "${YELLOW}Usage: $0 <project-name>${NC}"
    exit 1
fi

PROJECT_NAME=$1
CURRENT_YEAR=$(date +%Y)

# Create main project directory
echo -e "${BLUE}Creating project structure for: ${GREEN}$PROJECT_NAME${NC}"
mkdir -p "$PROJECT_NAME"/{cmd,internal,pkg,api,web,configs,init,scripts,build,deployments,test,docs,tools,examples}

# Create standard Go directories
cd "$PROJECT_NAME"

# Create main.go in cmd directory
mkdir -p "cmd/$PROJECT_NAME"
cat > "cmd/$PROJECT_NAME/main.go" << EOF
package main

import (
	"fmt"
	"log"
)

func main() {
	log.Println("Starting $PROJECT_NAME...")
	fmt.Println("Hello from $PROJECT_NAME!")
}
EOF

# Create a basic internal package
mkdir -p "internal/app"
cat > "internal/app/app.go" << EOF
package app

// App represents the main application
type App struct {
	// Add your application fields here
}

// New creates a new instance of the application
func New() *App {
	return &App{}
}

// Run starts the application
func (a *App) Run() error {
	// Add your application logic here
	return nil
}
EOF

# Create go.mod file
go mod init "github.com/yourusername/$PROJECT_NAME"

# Create README.md
cat > "README.md" << EOF
# $PROJECT_NAME

## Description

Add your project description here.

## Project Structure

\`\`\`
.
├── api/            # API definitions (proto files, OpenAPI/Swagger specs)
├── build/          # Build and CI/CD related files
├── cmd/            # Main applications
├── configs/        # Configuration files
├── deployments/    # Deployment configurations (docker, k8s, etc.)
├── docs/          # Documentation
├── examples/      # Examples
├── init/          # System init/setup scripts
├── internal/      # Private application and library code
├── pkg/           # Public library code
├── scripts/       # Scripts for development
├── test/          # Additional test applications and test data
├── tools/         # Development tools
└── web/           # Web specific components
\`\`\`

## Getting Started

### Prerequisites

- Go 1.21 or higher

### Installation

\`\`\`bash
git clone https://github.com/yourusername/$PROJECT_NAME.git
cd $PROJECT_NAME
go mod download
\`\`\`

### Running the Application

\`\`\`bash
go run cmd/$PROJECT_NAME/main.go
\`\`\`

## License

Copyright (c) $CURRENT_YEAR

This project is licensed under the MIT License - see the LICENSE file for details
EOF

# Create .gitignore
cat > ".gitignore" << EOF
# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with 'go test -c'
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/

# IDE specific files
.idea/
.vscode/
*.swp
*.swo

# OS specific files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
EOF

# Create LICENSE file (MIT License)
cat > "LICENSE" << EOF
MIT License

Copyright (c) $CURRENT_YEAR

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# Create Makefile with common commands
cat > "Makefile" << EOF
.PHONY: build clean test run

# Build the application
build:
	go build -o bin/$PROJECT_NAME cmd/$PROJECT_NAME/main.go

# Clean build files
clean:
	rm -rf bin/

# Run tests
test:
	go test ./...

# Run the application
run:
	go run cmd/$PROJECT_NAME/main.go
EOF

# Create directories for maintaining project organization
mkdir -p "configs/development"
mkdir -p "configs/production"
touch "configs/development/config.yaml"
touch "configs/production/config.yaml"

echo -e "${GREEN}✓ Project structure created successfully!${NC}"
echo -e "${BLUE}Project initialized at: ${YELLOW}$(pwd)${NC}"
echo -e "${BLUE}To get started:${NC}"
echo -e "  cd $PROJECT_NAME"
echo -e "  go mod tidy"
echo -e "  make run"
EOF 