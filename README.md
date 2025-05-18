# Say Hello API

A simple Express.js API that responds with a greeting message.

## Features

- Single endpoint `/sayHello` that returns a JSON response
- Runs on port 80
- Automated deployment using GitHub Actions

## Local Development

1. Install dependencies:
```bash
npm install
```

2. Start the server:
```bash
npm start
```

3. Test the API:
```bash
curl http://localhost/sayHello
```

## Deployment

The application is automatically deployed to the VM when changes are pushed to the main branch. The deployment process is handled by GitHub Actions.

### Required GitHub Secrets

The following secrets need to be configured in your GitHub repository:

- `VM_HOST`: The hostname or IP address of the VM
- `VM_USERNAME`: The username for SSH access
- `VM_SSH_KEY`: The private SSH key for authentication

## API Endpoints

### GET /sayHello

Returns a JSON response with a greeting message.

Response:
```json
{
    "message": "Hello User"
}
``` 