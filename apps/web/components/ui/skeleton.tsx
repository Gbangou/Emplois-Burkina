import { cn } from "@/lib/utils";

export function Skeleton({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) {
  return (
    <div
      className={cn("skeleton", className)}
      {...props}
    />
  );
}

export function JobCardSkeleton() {
  return (
    <div className="rounded-xl border border-border bg-card overflow-hidden">
      <div className="h-0.5 bg-muted" />
      <div className="p-5 grid gap-3">
        <div className="flex items-center justify-between">
          <Skeleton className="h-5 w-24 rounded-full" />
          <Skeleton className="h-5 w-10 rounded-full" />
        </div>
        <div className="grid gap-1.5">
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-3/4" />
          <Skeleton className="h-3.5 w-1/2 mt-1" />
        </div>
        <div className="flex gap-1.5">
          <Skeleton className="h-6 w-20 rounded-md" />
          <Skeleton className="h-6 w-16 rounded-md" />
          <Skeleton className="h-6 w-24 rounded-md" />
        </div>
        <div className="flex justify-between pt-2 border-t border-border">
          <Skeleton className="h-4 w-28" />
          <Skeleton className="h-4 w-12" />
        </div>
      </div>
    </div>
  );
}
