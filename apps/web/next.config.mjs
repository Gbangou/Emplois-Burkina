/** @type {import('next').NextConfig} */
const nextConfig = {
  allowedDevOrigins: ["127.0.0.1", "localhost"],
  typedRoutes: false,
  transpilePackages: ["@emplois-burkina/domain"]
};

export default nextConfig;
