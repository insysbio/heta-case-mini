%{
  This model was created by qs3p-js.
  Additional functions and constants for compatibility see in "fun.m"
  export from : simbio @SimbioExport {...};
  
  
%}

sbioaddtolibrary(sbiounit('week', 'day', 7));
sbioaddtolibrary(sbiounit('xxx', 'nanomole', 1));

one_model = sbiomodel('one');

% Useful parameters
addparameter(one_model, 'timeOne', 1, 'ValueUnits', 'hour');

% Compartments
one.compartment.comp1 = addcompartment(one_model, 'comp1', 'ConstantCapacity', false, 'Capacity', 1, 'Notes', '', 'Tag', '');

% Species
one.species.A = addspecies(one.compartment.comp1, 'A', 'ConstantAmount', false, 'InitialAmount', 10, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
one.species.B = addspecies(one.compartment.comp1, 'B', 'ConstantAmount', false, 'InitialAmount', 0, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');

% Parameters
one.parameter.k1 = addparameter(one_model, 'k1', 'ConstantValue', true, 'Value', 0.12, 'Notes', '', 'Tag', '');

% Reactions
one.reaction.r1 = addreaction(one_model, 'null -> null', 'Name', 'r1', 'Active', true, 'Reversible', true, 'ReactionRate', 'k1 * A * comp1', 'Notes', '', 'Tag', '');
  addreactant(one.reaction.r1, [one.species.A, ], [1, ]);
  addproduct(one.reaction.r1, [one.species.B, ], [2, ]);







