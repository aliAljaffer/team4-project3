# Multi-stage build for better optimization
FROM node:25-alpine3.21 AS builder

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies (including dev dependencies for build)
RUN npm install npm ci && npm cache clean --forcenpm ci && npm cache clean --force npm cache clean --force

# Copy source code
COPY tsconfig.json ./
COPY src ./src
COPY db-data ./db-data

# Build the TypeScript application
RUN npm run build

# Production stage
FROM node:25-alpine3.21 AS production

# Create non-root user and group for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ONLY production dependencies
RUN npm install --omit=dev npm ci --only=production && npm cache clean --forcenpm ci --only=production && npm cache clean --force npm cache clean --force

# Copy built application from builder stage
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/db-data ./db-data

# Change ownership of the app directory to the nodejs user
RUN chown -R nodejs:nodejs /app
USER nextjs

# Expose port 4001
EXPOSE 4001

# Set environment variables
ENV NODE_ENV=production
ENV PORT=4001

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:4001/api/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Start the application
CMD ["node", "dist/server.js"]