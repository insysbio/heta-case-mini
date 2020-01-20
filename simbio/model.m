%{
  This model was created by qs3p-js.
  Additional functions and constants for compatibility see in "fun.m"
  export from : simbio @SimbioExport {...};
  
  
%}

sbioaddtolibrary(sbiounit('week', 'day', 7));
sbioaddtolibrary(sbiounit('xxx', 'nanomole', 1));

simbio_model = sbiomodel('simbio');

% Useful parameters
addparameter(simbio_model, 'timeOne', 1, 'ValueUnits', 'hour');

% Compartments
simbio.compartment.comp1 = addcompartment(simbio_model, 'comp1', 'ConstantCapacity', false, 'Capacity', 1, 'Notes', '', 'Tag', '');

% Species
simbio.species.A = addspecies(simbio.compartment.comp1, 'A', 'ConstantAmount', false, 'InitialAmount', 10, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
simbio.species.B = addspecies(simbio.compartment.comp1, 'B', 'ConstantAmount', false, 'InitialAmount', 0, 'BoundaryCondition', false, 'Notes', '', 'Tag', '');

% Parameters
simbio.parameter.k1 = addparameter(simbio_model, 'k1', 'ConstantValue', true, 'Value', 0.12, 'Notes', '', 'Tag', '');

% Reactions
simbio.reaction.r1 = addreaction(simbio_model, 'null -> null', 'Name', 'r1', 'Active', true, 'Reversible', false, 'ReactionRate', 'k1 * A * comp1', 'Notes', '', 'Tag', '');
  addreactant(simbio.reaction.r1, [simbio.species.A, ], [1, ]);
  addproduct(simbio.reaction.r1, [simbio.species.B, ], [2, ]);








