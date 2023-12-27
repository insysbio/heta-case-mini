%{
  This model was created by Heta compiler.
  Additional functions see in the directory
  export from : #export { format: Simbio, namespace: nameless, ...};
%}

%sbioaddtolibrary(sbiounit('week', 'day', 7));

nameless_model = sbiomodel('nameless');

% Compartments
nameless_ns.compartment.comp1 = addcompartment(nameless_model, 'comp1', 'ConstantCapacity', false, 'Capacity', 1, 'Notes', '', 'Tag', '');

% Species
nameless_ns.species.A = addspecies(nameless_ns.compartment.comp1, 'A', 'ConstantAmount', false, 'InitialAmount', 10, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless_ns.species.B = addspecies(nameless_ns.compartment.comp1, 'B', 'ConstantAmount', false, 'InitialAmount', 0, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');

% Parameters
nameless_ns.parameter.k1 = addparameter(nameless_model, 'k1', 'ConstantValue', true, 'Value', 0.12, 'Notes', '', 'Tag', '');

% Reactions
nameless_ns.reaction.r1 = addreaction(nameless_model, 'null -> null', 'Name', 'r1', 'Active', true, 'Reversible', false, 'ReactionRate', 'k1 * A * comp1', 'Notes', '', 'Tag', '');
  addreactant(nameless_ns.reaction.r1, [nameless_ns.species.A, ], [1, ]);
  addproduct(nameless_ns.reaction.r1, [nameless_ns.species.B, ], [2, ]);










% Update simulation config
nameless_ns.config = getconfigset(nameless_model)
set(nameless_ns.config.SolverOptions, 'AbsoluteToleranceScaling', false)
