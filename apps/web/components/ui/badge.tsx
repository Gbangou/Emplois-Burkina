import * as React from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@/lib/utils";

const badgeVariants = cva(
  "inline-flex items-center gap-1.5 rounded-full border px-2.5 py-1 text-xs font-black transition-colors",
  {
    variants: {
      variant: {
        default: "border-transparent bg-primary text-primary-foreground",
        secondary: "border-transparent bg-secondary text-secondary-foreground",
        outline: "border-border text-foreground bg-transparent",
        destructive: "border-transparent bg-destructive/10 text-destructive border-destructive/20",
        success: "border-transparent bg-emerald-50 text-emerald-800 border-emerald-200",
        warning: "border-transparent bg-amber-50 text-amber-800 border-amber-200",
        blue: "border-transparent bg-blue-50 text-blue-800 border-blue-200",
        violet: "border-transparent bg-violet-50 text-violet-800 border-violet-200",
        cyan: "border-transparent bg-cyan-50 text-cyan-800 border-cyan-200",
        muted: "border-border bg-muted text-muted-foreground"
      }
    },
    defaultVariants: { variant: "default" }
  }
);

export interface BadgeProps
  extends React.HTMLAttributes<HTMLSpanElement>,
    VariantProps<typeof badgeVariants> {}

function Badge({ className, variant, ...props }: BadgeProps) {
  return <span className={cn(badgeVariants({ variant }), className)} {...props} />;
}

export { Badge, badgeVariants };
