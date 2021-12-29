%{
  This model was created by Heta compiler.
  Additional functions see in the directory
  export from : #export { format: Simbio, namespace: nameless, ...};
%}

sbioaddtolibrary(sbiounit('week', 'day', 7));

nameless_model = sbiomodel('nameless');

% Compartments
nameless.compartment.comp1 = addcompartment(nameless_model, 'comp1', 'ConstantCapacity', false, 'Capacity', 1, 'Notes', '', 'Tag', '');

% Species
nameless.species.A = addspecies(nameless.compartment.comp1, 'A', 'ConstantAmount', false, 'InitialAmount', 10, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.B = addspecies(nameless.compartment.comp1, 'B', 'ConstantAmount', false, 'InitialAmount', 0, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');

% Parameters
nameless.parameter.k1 = addparameter(nameless_model, 'k1', 'ConstantValue', true, 'Value', 0.12, 'Notes', '', 'Tag', '');

% Reactions
nameless.reaction.r1 = addreaction(nameless_model, 'null -> null', 'Name', 'r1', 'Active', true, 'Reversible', false, 'ReactionRate', 'k1 * A * comp1', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.r1, [nameless.species.A, ], [1, ]);
  addproduct(nameless.reaction.r1, [nameless.species.B, ], [2, ]);










% Update simulation config
nameless.config = getconfigset(nameless_model)
set(nameless.config.SolverOptions, 'AbsoluteToleranceScaling', false)
