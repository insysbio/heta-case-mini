%{
  This model was created by qs3p-js.
  Additional functions and constants for compatibility see in "fun.m"
  export from : simbio @SimbioExport {...};
  
  
%}

sbioaddtolibrary(sbiounit('week', 'day', 7));
sbioaddtolibrary(sbiounit('xxx', 'nanomole', 1));

undefined_model = sbiomodel('');

% Useful parameters
addparameter(undefined_model, 'timeOne', 1, 'ValueUnits', 'hour');

% Compartments
.compartment.comp1 = addcompartment(undefined_model, 'comp1', 'ConstantCapacity', false, 'Capacity', 1, 'Notes', '', 'Tag', '');

% Species
.species.A = addspecies(.compartment.comp1, 'A', 'ConstantAmount', false, 'InitialAmount', 10, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
.species.B = addspecies(.compartment.comp1, 'B', 'ConstantAmount', false, 'InitialAmount', 0, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');

% Parameters
.parameter.k1 = addparameter(undefined_model, 'k1', 'ConstantValue', true, 'Value', 0.12, 'Notes', '', 'Tag', '');

% Reactions
.reaction.r1 = addreaction(undefined_model, 'null -> null', 'Name', 'r1', 'Active', true, 'Reversible', false, 'ReactionRate', 'k1 * A * comp1', 'Notes', '', 'Tag', '');
  addreactant(.reaction.r1, [.species.A, ], [1, ]);
  addproduct(.reaction.r1, [.species.B, ], [2, ]);







