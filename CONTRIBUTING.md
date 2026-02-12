# Contributing to MedMail Intelligence Platform

First off, thank you for considering contributing to MedMail Intelligence Platform! It's people like you that make this project a great tool for healthcare professionals.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Commit Messages](#commit-messages)
- [Testing Guidelines](#testing-guidelines)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## 🤝 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** to demonstrate the steps
- **Describe the behavior you observed** and what behavior you expected
- **Include screenshots and animated GIFs** if relevant
- **Include your environment details** (OS, Python version, Node version, etc.)

**Bug Report Template:**

```markdown
### Description
[Clear description of the bug]

### Steps to Reproduce
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

### Expected Behavior
[What you expected to happen]

### Actual Behavior
[What actually happened]

### Environment
- OS: [e.g., Windows 10, Ubuntu 20.04]
- Python Version: [e.g., 3.9.7]
- Node Version: [e.g., 16.14.0]
- Browser: [e.g., Chrome 98]

### Additional Context
[Any other context about the problem]
```

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a step-by-step description** of the suggested enhancement
- **Provide specific examples** to demonstrate the enhancement
- **Describe the current behavior** and explain the behavior you'd like to see
- **Explain why this enhancement would be useful**

### Your First Code Contribution

Unsure where to begin? You can start by looking through these issues:

- `good-first-issue` - Issues that should only require a few lines of code
- `help-wanted` - Issues that need assistance

### Pull Requests

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🛠️ Development Setup

### Prerequisites

- Python 3.9 or higher
- Node.js 16 or higher
- PostgreSQL 13 or higher (or use Docker)
- Git

### Setup Instructions

1. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR-USERNAME/Gmail-Automation.git
   cd Gmail-Automation
   ```

2. **Set up the backend:**
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Set up the frontend:**
   ```bash
   npm install
   ```

4. **Run the application:**
   ```bash
   # Terminal 1: Backend
   cd backend
   uvicorn app.main:app --reload

   # Terminal 2: Frontend
   npm run dev
   ```

## 🔄 Pull Request Process

1. **Update documentation** - Ensure README.md, docs/, or other documentation is updated with details of changes
2. **Add tests** - Include tests for new features or bug fixes
3. **Follow coding standards** - Ensure your code follows the project's coding style
4. **Update the changelog** - Add your changes to CHANGELOG.md (if it exists)
5. **One feature per PR** - Keep pull requests focused on a single feature or bug fix
6. **Pass all tests** - Ensure all existing and new tests pass
7. **Get approval** - Your PR will be reviewed by maintainers

### Pull Request Template

```markdown
## Description
[Describe your changes in detail]

## Motivation and Context
[Why is this change required? What problem does it solve?]

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## How Has This Been Tested?
[Describe the tests you ran to verify your changes]

## Screenshots (if appropriate):
[Add screenshots to demonstrate the changes]

## Checklist:
- [ ] My code follows the code style of this project
- [ ] I have updated the documentation accordingly
- [ ] I have added tests to cover my changes
- [ ] All new and existing tests passed
- [ ] My changes generate no new warnings
- [ ] I have checked my code and corrected any misspellings
```

## 💻 Coding Standards

### Python (Backend)

- Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide
- Use type hints where applicable
- Write docstrings for all public functions, classes, and modules
- Maximum line length: 100 characters
- Use meaningful variable and function names

**Example:**

```python
from typing import List, Optional

def categorize_email(
    email_content: str,
    sender: str,
    use_ai: bool = True
) -> Optional[str]:
    """
    Categorize an email using AI-powered classification.
    
    Args:
        email_content: The body content of the email
        sender: The email address of the sender
        use_ai: Whether to use AI categorization (default: True)
    
    Returns:
        The category name if successful, None otherwise
    
    Raises:
        ValueError: If email_content is empty
    """
    if not email_content:
        raise ValueError("Email content cannot be empty")
    
    # Implementation here
    pass
```

### TypeScript/JavaScript (Frontend)

- Follow the existing code style in the project
- Use TypeScript for type safety
- Use functional components with hooks
- Use meaningful component and variable names
- Maximum line length: 100 characters

**Example:**

```typescript
interface EmailProps {
  id: string;
  subject: string;
  sender: string;
  category?: string;
  onCategorize?: (category: string) => void;
}

export const EmailItem: React.FC<EmailProps> = ({
  id,
  subject,
  sender,
  category,
  onCategorize
}) => {
  const [isLoading, setIsLoading] = useState(false);

  const handleCategorize = async () => {
    setIsLoading(true);
    try {
      // Implementation
    } catch (error) {
      console.error('Categorization failed:', error);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    // JSX here
  );
};
```

### General Guidelines

- **DRY (Don't Repeat Yourself)** - Avoid code duplication
- **KISS (Keep It Simple, Stupid)** - Keep code simple and readable
- **YAGNI (You Aren't Gonna Need It)** - Don't add functionality until it's necessary
- **Write self-documenting code** - Use clear names and structure
- **Comment complex logic** - Explain "why", not "what"

## 📝 Commit Messages

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Code style changes (formatting, semicolons, etc.)
- **refactor**: Code refactoring without adding features or fixing bugs
- **perf**: Performance improvements
- **test**: Adding or updating tests
- **chore**: Maintenance tasks, dependency updates, etc.
- **ci**: CI/CD changes

### Examples

```
feat(email): add bulk categorization functionality

Implemented bulk categorization feature that allows users to
categorize multiple emails at once using AI.

Closes #123
```

```
fix(auth): resolve JWT token expiration issue

Fixed bug where JWT tokens were not being properly refreshed,
causing users to be logged out prematurely.

Fixes #456
```

## 🧪 Testing Guidelines

### Backend Tests

- Write unit tests for all new functions and classes
- Write integration tests for API endpoints
- Aim for at least 80% code coverage
- Use pytest for testing
- Mock external services (Gmail API, OpenAI API)

**Example:**

```python
import pytest
from app.services.ai_categorizer import categorize_email

def test_categorize_email_success():
    """Test successful email categorization."""
    result = categorize_email(
        content="Patient appointment scheduled for next week",
        sender="doctor@hospital.com"
    )
    assert result == "Appointment Confirmation"

def test_categorize_email_empty_content():
    """Test categorization with empty content."""
    with pytest.raises(ValueError):
        categorize_email(content="", sender="test@test.com")
```

### Frontend Tests

- Write unit tests for utility functions
- Write component tests for UI components
- Test user interactions and edge cases
- Use React Testing Library

**Example:**

```typescript
import { render, screen, fireEvent } from '@testing-library/react';
import { EmailItem } from './EmailItem';

describe('EmailItem', () => {
  it('renders email subject and sender', () => {
    render(
      <EmailItem
        id="1"
        subject="Test Email"
        sender="test@example.com"
      />
    );
    
    expect(screen.getByText('Test Email')).toBeInTheDocument();
    expect(screen.getByText('test@example.com')).toBeInTheDocument();
  });

  it('calls onCategorize when categorize button is clicked', () => {
    const mockCategorize = jest.fn();
    render(
      <EmailItem
        id="1"
        subject="Test Email"
        sender="test@example.com"
        onCategorize={mockCategorize}
      />
    );
    
    fireEvent.click(screen.getByText('Categorize'));
    expect(mockCategorize).toHaveBeenCalled();
  });
});
```

## 🔍 Code Review Process

All submissions require review. We use GitHub pull requests for this purpose. Reviewers will look for:

- Code quality and style
- Test coverage
- Documentation
- Performance implications
- Security considerations
- Backward compatibility

## 🎨 UI/UX Guidelines

- Follow the existing design patterns
- Use shadcn/ui components when possible
- Ensure responsive design (mobile, tablet, desktop)
- Maintain accessibility standards (WCAG 2.1 Level AA)
- Use consistent spacing and colors from Tailwind config

## 🔐 Security

- Never commit sensitive information (API keys, passwords, etc.)
- Use environment variables for configuration
- Validate all user inputs
- Follow security best practices
- Report security vulnerabilities privately (see SECURITY.md)

## 📚 Additional Resources

- [Project Documentation](docs/)
- [API Documentation](http://localhost:8000/api/docs)
- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [React Documentation](https://react.dev/)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)

## ❓ Questions?

Feel free to:
- Open an issue with your question
- Reach out to the maintainers
- Join our community discussions

## 🙏 Thank You!

Your contributions make this project better for everyone. We appreciate your time and effort!

---

**Happy Coding! 🚀**
