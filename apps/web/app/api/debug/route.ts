import { NextResponse } from "next/server";
import { join } from "node:path";
import { existsSync } from "node:fs";

export async function GET() {
  const cwd = process.cwd();
  const cwdNorm = cwd.replace(/\\/g, "/");
  const isWeb = cwdNorm.endsWith("apps/web");
  const root = isWeb ? join(cwd, "..", "..") : cwd;
  const dataPath = join(root, "data/curated-jobs.json");

  return NextResponse.json({
    cwd,
    cwdNorm,
    isWeb,
    root,
    dataPath,
    dataExists: existsSync(dataPath)
  });
}
