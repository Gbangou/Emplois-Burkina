import * as React from "react";
import { ChevronDown } from "lucide-react";
import { cn } from "@/lib/utils";

export interface SelectProps extends React.SelectHTMLAttributes<HTMLSelectElement> {}

const Select = React.forwardRef<HTMLSelectElement, SelectProps>(({ className, children, ...props }, ref) => {
  return (
    <div className="relative">
      <select
        className={cn(
          "flex h-10 w-full appearance-none rounded-lg border border-input bg-background pl-3 pr-9 py-2",
          "text-sm font-medium text-foreground ring-offset-background",
          "focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-0",
          "disabled:cursor-not-allowed disabled:opacity-50 cursor-pointer",
          "transition-colors",
          className
        )}
        ref={ref}
        {...props}
      >
        {children}
      </select>
      <ChevronDown
        size={14}
        className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground pointer-events-none"
      />
    </div>
  );
});
Select.displayName = "Select";

export { Select };
