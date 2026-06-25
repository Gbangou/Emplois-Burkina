import { IsEmail, IsIn, IsOptional, IsString, MaxLength } from "class-validator";

export class CreateLeadDto {
  @IsIn(["alert", "publish", "sponsor", "contact"])
  kind!: "alert" | "publish" | "sponsor" | "contact";

  @IsOptional()
  @IsString()
  @MaxLength(140)
  name?: string;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsOptional()
  @IsString()
  @MaxLength(40)
  phone?: string;

  @IsOptional()
  @IsString()
  @MaxLength(600)
  message?: string;

  @IsOptional()
  @IsString()
  @MaxLength(180)
  interest?: string;
}
