import { ImageResponse } from "next/og";

export const size = {
  width: 1200,
  height: 630
};

export const contentType = "image/png";

export default function Image() {
  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          background: "#f8fafc",
          color: "#0f172a",
          padding: 64,
          fontFamily: "Arial, sans-serif"
        }}
      >
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <div style={{ fontSize: 28, fontWeight: 900, color: "#0f6b3d" }}>Emplois Burkina</div>
          <div style={{ fontSize: 22, fontWeight: 800, color: "#475569" }}>Offres + guides + alertes</div>
        </div>

        <div style={{ display: "flex", flexDirection: "column", gap: 24 }}>
          <div style={{ fontSize: 72, lineHeight: 0.95, fontWeight: 950, letterSpacing: 0 }}>
            Trouver un emploi fiable au Burkina Faso
          </div>
          <div style={{ maxWidth: 850, fontSize: 32, lineHeight: 1.25, color: "#334155", fontWeight: 700 }}>
            Offres verifiees, concours, ONG, remote, guides candidats et sources publiques suivies automatiquement.
          </div>
        </div>

        <div style={{ display: "flex", gap: 16 }}>
          {["Ouagadougou", "ONG", "Concours", "Remote", "CV ATS"].map((item) => (
            <div
              key={item}
              style={{
                border: "2px solid #bbf7d0",
                background: "#ecfdf5",
                color: "#166534",
                borderRadius: 999,
                padding: "12px 22px",
                fontSize: 22,
                fontWeight: 900
              }}
            >
              {item}
            </div>
          ))}
        </div>
      </div>
    ),
    size
  );
}
