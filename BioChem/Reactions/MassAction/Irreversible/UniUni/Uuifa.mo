within BioChem.Reactions.MassAction.Irreversible.UniUni;

model Uuifa "Uni-uni irrerversible forward activation reaction"
  extends BioChem.Interfaces.Reactions.Uui;
  extends BioChem.Interfaces.Reactions.Modifiers.ActivatorForward;
  parameter BioChem.Units.ReactionCoefficient k1 = 1 "Forwards reaction coefficient for the reaction";
equation
  rr = k1 * aF1.c * s1.c ^ nS1 * s1.V;
  annotation(
    Documentation,
    Icon(coordinateSystem(extent = {{-100, 100}, {100, -100}}, preserveAspectRatio = true, grid = {10, 10})),
    Diagram(coordinateSystem(extent = {{-100, 100}, {100, -100}}, preserveAspectRatio = true, grid = {10, 10})));
end Uuifa;
