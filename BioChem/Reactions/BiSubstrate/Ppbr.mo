within BioChem.Reactions.BiSubstrate;

model Ppbr "Ping pong bi-bi kinetics"
  extends BioChem.Interfaces.Reactions.Basics.Reaction;
  extends BioChem.Interfaces.Reactions.Basics.TwoSubstratesReversible;
  extends BioChem.Interfaces.Reactions.Basics.TwoProducts;
  parameter BioChem.Units.Concentration Keq = 1 "Equilibrium constant";
  parameter BioChem.Units.Concentration KiS1 = 1 "Product inhibition constant of s1.c acting on the reverse reaction";
  parameter BioChem.Units.Concentration KiP2 = 1 "Product inhibition constant of p2.c acting on the forward reaction";
  parameter BioChem.Units.Concentration KmS1 = 1 "Concentration of s1.c such that v = vF/2 (Michaelis constant) at zero p1.c and zero p2.c";
  parameter BioChem.Units.Concentration KmS2 = 1 "Concentration of s2.c such that v = vF/2 (Michaelis constant) at saturating s1.c and zero p1.c";
  parameter BioChem.Units.Concentration KmP1 = 1 "Concentration of p1.c such that v = -vR/2 (Michaelis constant) at zero s1.c and zero s2.c";
  parameter BioChem.Units.Concentration KmP2 = 1 "Concentration of p2.c such that v = -vR/2 (Michaelis constant) at zero s1.c and saturating p1.c";
  parameter BioChem.Units.ReactionRate vF = 1 "Forward maximum velocity";
  parameter BioChem.Units.ReactionRate vR = 1 "Reverse maximum velocity";
protected
  Real K1;
equation
  s1.r = rr;
  s2.r = rr;
  p1.r = -rr;
  p2.r = -rr;
  K1 = vF / (vR * Keq) * (KmP2 * p1.c * (1 + s1.c / KiS1) + p2.c * (KmP1 + p1.c));
  rr = vF * (s1.c * s2.c - p1.c * p2.c / Keq) / (s1.c * s2.c + KmS2 * s1.c + KmS1 * s2.c * (1 + p2.c / KiP2) + K1);
  annotation(
    Documentation(info = "<html>
 <p>
 Ping pong bi-bi kinetics.
 </p>
 </html>"),
    Icon(coordinateSystem(extent = {{-100, 100}, {100, -100}}, preserveAspectRatio = true, grid = {10, 10})),
    Diagram(coordinateSystem(extent = {{-100, 100}, {100, -100}}, preserveAspectRatio = true, grid = {10, 10})));
end Ppbr;
