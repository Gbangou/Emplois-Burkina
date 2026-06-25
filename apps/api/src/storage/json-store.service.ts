import { Injectable } from "@nestjs/common";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";

@Injectable()
export class JsonStore {
  private readonly root = process.cwd().endsWith(join("apps", "api")) ? join(process.cwd(), "..", "..") : process.cwd();

  async read<T>(path: string, fallback: T): Promise<T> {
    try {
      const content = await readFile(join(this.root, path), "utf8");
      return JSON.parse(content) as T;
    } catch {
      return fallback;
    }
  }

  async write<T>(path: string, value: T): Promise<void> {
    const absolute = join(this.root, path);
    await mkdir(dirname(absolute), { recursive: true });
    await writeFile(absolute, `${JSON.stringify(value, null, 2)}\n`, "utf8");
  }
}
