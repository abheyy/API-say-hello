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

### Zero-Downtime Deployment

The application uses a blue-green deployment strategy to ensure zero downtime during deployments:

1. Two environments (blue and green) are maintained on the server
2. New code is deployed to the inactive environment
3. Once the new deployment is verified, traffic is switched to the new environment
4. The old environment is gracefully shut down

This approach ensures that users experience no interruption in service during deployments.

## API Endpoints

### GET /sayHello

Returns a JSON response with a greeting message.

Response:
```json
{
    "message": "Hello User"
}
```