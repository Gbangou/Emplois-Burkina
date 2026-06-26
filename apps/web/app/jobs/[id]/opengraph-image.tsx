import { ImageResponse } from "next/og";
import { getJobs } from "@/lib/data";
import { getJobDeadline } from "@/lib/seo";

export const size = {
  width: 1200,
  height: 630
};

export const contentType = "image/png";

type ImageProps = {
  params: Promise<{ id: string }>;
};

function truncate(value: string, max = 82) {
  return value.length > max ? `${value.slice(0, max - 1)}...` : value;
}

export default async function Image({ params }: ImageProps) {
  const { id } = await params;
  const jobs = await getJobs();
  const job = jobs.find((item) => item.id === id);
  const title = job ? truncate(job.title) : "Offre d'emploi au Burkina Faso";
  const company = job?.company || job?.sourceName || "Source verifiee";
  const deadline = job ? getJobDeadline(job) : "";
  const confidence = job?.confidenceScore || 70;

  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          background: "#07171e",
          color: "white",
          padding: 64,
          fontFamily: "Arial, sans-serif"
        }}
      >
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <div style={{ display: "flex", fontSize: 28, fontWeight: 900, color: "#7dd3fc" }}>Emplois Burkina</div>
          <div
            style={{
              display: "flex",
              border: "2px solid #86efac",
              color: "#bbf7d0",
              borderRadius: 999,
              padding: "10px 18px",
              fontSize: 22,
              fontWeight: 900
            }}
          >
            Score {confidence}%
          </div>
        </div>

        <div style={{ display: "flex", flexDirection: "column", gap: 24 }}>
          <div style={{ display: "flex", fontSize: 68, lineHeight: 0.98, fontWeight: 950, letterSpacing: 0 }}>
            {title}
          </div>
          <div style={{ display: "flex", gap: 18, flexWrap: "wrap", fontSize: 28, fontWeight: 800, color: "#cbd5e1" }}>
            <div style={{ display: "flex" }}>{company}</div>
            {job?.city ? <div style={{ display: "flex" }}>-- {job.city}</div> : null}
            {deadline ? <div style={{ display: "flex" }}>-- Deadline {deadline}</div> : null}
          </div>
        </div>

        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <div style={{ display: "flex", fontSize: 24, color: "#e2e8f0", fontWeight: 800 }}>
            Voir les details et la source officielle
          </div>
          <div style={{ display: "flex", fontSize: 24, color: "#facc15", fontWeight: 900 }}>emplois-burkina.com</div>
        </div>
      </div>
    ),
    size
  );
}
