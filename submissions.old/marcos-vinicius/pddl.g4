grammar pddl;

domain :
  '(' 'define' name requirementDefinition? typesDefinition? constantsDefinition? predicatesDefinition?
                    functionsDefinition? constraintsDefinition? structureDefinition* ')' ;

requirementDefinition:
  '(' ':requirements' REQUIREMENT+ ')';

typesDefinition:
  '(' ':types' typedNames ')';

constantsDefinition:
  '(' ':constants' typedNames ')';

predicatesDefinition:
  '(' ':predicates' atomicFormula+ ')';

atomicFormula:
  '(' predicate typedVariables ')';

predicate:
  name;

variable:
  name;

atomicFunctionSkeleton:
  '(' functionSymbol typedVariables ')';

functionSymbol:
  name;

functionsDefinition:
  '(' ':functions' functionTypedListOfAtomicFunctionSkeleton ')';

functionTypedListOfAtomicFunctionSkeleton:
  (atomicFunctionSkeleton '-' functionType functionTypedListOfAtomicFunctionSkeleton?) | atomicFunctionSkeleton;

functionType:
  'number' | type;

constraintsDefinition:
  '(' ':constraintsDefinition' conGD ')';

structureDefinition:
  actionDef | ':durative-actions' durativeActionDef | ':derided-predicates' derivedDef;

typedNames:
  name+ | (typedTypes typedNames?);

typedTypes:
  (name+ type);

typedVariables:
  variable+ | (typedVariable typedVariables?);

typedVariable:
  variable+ type;

primitiveType:
  name;

type:
  '(' 'either' primitiveType+ ')' | primitiveType;

emptyOrPreGD:
  '(' ')' | preGD;

emptyOrEffect:
  '(' ')' | effect;
  
emptyOrDaGD:
  '(' ')' | daGD;

emptyOrDaEffect:
  '(' ')' | daEffect;

actionDef:
  '(' ':action' actionSymbol ':parameters' '(' typedVariables ')' actionDefBody ')';

actionSymbol:
  name;

actionDefBody:
  (':precondition' emptyOrPreGD)? (':effect' emptyOrEffect);

preGD:
  prefGD | '(' 'and' preGD* ')' | '(' 'forall' '(' typedVariables ')' preGD ')';

prefGD:
  '(' 'preference' prefName? gd ')' | gd;

prefName:
  name;

gd:
  atomicFormulaOfTerm | literalTerm | '(' 'and' gd* ')' | '(' 'or' gd* ')' | '(' 'not' gd ')' | '(' 'imply' gd gd ')'
      | '(' 'exists' '(' typedVariables ')' gd ')' | '(' 'forall' '(' typedVariables ')' gd ')' | fComp;

fComp:
  '(' binaryComp fExp fExp ')';

literalTerm:
  atomicFormulaOfTerm | '(' 'not' atomicFormulaOfTerm ')';
  
literalName:
  atomicFormulaOfName | '(' 'not' atomicFormulaOfName ')';

atomicFormulaOfTerm:
  '(' predicate term* ')' | '(' '=' term term ')' ;

atomicFormulaOfName:
  '(' predicate name* ')' | '(' '=' name name ')' ;

term:
  name | variable | functionTerm;

functionTerm:
  '(' functionSymbol term* ')';

fExp:
  NUMBER | '(' binaryOp fExp fExp ')' | '(' multiOp ')' fExp fExp+ ')' | '-' fExp | fHead;

fHead:
  '(' functionSymbol term* ')' | functionSymbol;

binaryOp:
  multiOp | '-' | '/';

multiOp:
  '*' | '+';

binaryComp:
  '>' | '<' | '=' | '>=' | '<=';

effect:
  '(' 'and' cEffect* ')' | cEffect;

cEffect:
  '(' 'forall' '(' typedVariables ')' effect ')' | '(' 'when' gd condEffect ')' | pEffect;

pEffect:
  '(' 'not' atomicFormulaOfTerm ')' | atomicFormulaOfTerm | '(' ASSIGNOP fHead fExp ')' | '(' 'assign' functionTerm term ')'
      | '(' 'assign' functionTerm 'undefined' ')';

condEffect:
  '(' 'and' pEffect* ')' | pEffect;

durativeActionDef:
  '(' ':durativeAction' daSymbol ':parameters' '(' typedVariables ')' daDefBody ')';

daSymbol:
  name;

daDefBody:
  ':duration' durationConstraint ':condition' emptyOrDaGD ':effect' emptyOrDaEffect;

daGD:
  prefTimedGd | '(' 'and' daGD* ')' | '(' 'forall' '(' typedVariables ')' daGD ')';

prefTimedGd:
  timedGd | '(' 'preference' prefName? timedGd ')';

timedGd:
  '(' 'at' timeSpecifier gd ')' | '(' 'over' interval gd ')';

timeSpecifier:
  'start' | 'end';

interval:
  'all';

durationConstraint:
  '(' 'and' simpleDurationConstraint+ ')' | '(' ')' | simpleDurationConstraint;

simpleDurationConstraint:
  '(' dOp '?duration' dValue ')' | '(' 'at' timeSpecifier simpleDurationConstraint ')';

dOp:
  '<=' | '>=' | '=';

dValue:
  NUMBER | fExp;

daEffect:
  '(' 'and' daEffect* ')' | timedEffect | '(' 'forall' '(' typedVariables ')' daEffect ')' | '(' 'when' daGD timedEffect ')';

timedEffect:
  '(' 'at' timeSpecifier condEffect ')' | '(' 'at' timeSpecifier fAssignDa ')' | '(' assignOpT fHead fExpT ')';

fAssignDa:
  '(' ASSIGNOP fHead fExpDa ')';

fExpDa:
  '(' binaryOp fExpDa fExpDa ')' | '(' multiOp fExpDa fExpDa+ ')' | '(' '-' fExpDa ')' | '?duration' | fExp ;

assignOpT:
  'increase' | 'decrease';

fExpT:
  '(' '*' fExp '#t' ')' | '(' '*' '#t' fExp ')' | '#t';

derivedDef:
  '(' ':derived' atomicFormula gd ')';

problem: '(' 'define' '(' 'problem' name ')' '(' ':domain' name ')'
    requirementDefinition? objectDeclaration? init goal prefConstraints metricSpec lengthSpec ')';

objectDeclaration:
  '(' ':object' typedNames ')';

init:
  '(' ':init' initEl* ')';

initEl:
  literalName | '(' 'at' NUMBER literalName ')' | '(' '=' basicFunctionTerm NUMBER ')' | '(' '=' basicFunctionTerm name ')';

basicFunctionTerm:
  functionSymbol | '(' functionSymbol name* ')';

goal:
  '(' ':goal' preGD ')';

prefConstraints:
  '(' ':constraintsDefinition' prefConGD ')';

prefConGD:
  '(' 'and' prefConGD* ')' | '(' 'forall' '(' typedVariables ')' prefConGD ')'
      | '(' 'preference' prefName? conGD ')' | conGD;

conGD:
  '(' 'and' conGD* ')' | '(' 'forall' '(' typedVariables ')' conGD ')' | '(' 'at' 'end' gd ')' | '(' 'always' gd ')' |
    '(' 'sometime' gd ')' | '(' 'within' NUMBER gd ')' | '(' 'at-most-once' gd ')' | '(' 'sometime-after' gd gd ')' |
     '(' 'sometime-before' gd gd ')' | '(' 'always-within' NUMBER gd gd ')' | '(' 'hold-during' NUMBER NUMBER gd ')' |
       '(' 'hold-after' NUMBER gd ')' ;

metricSpec:
  '(' ':metric' optimization metricFExp ')';

metricFExp:
  '(' binaryOp metricFExp metricFExp ')' | '(' multiOp metricFExp metricFExp+ ')' | '(' '-' metricFExp ')' | NUMBER |
    '(' functionSymbol name* ')' | functionSymbol | 'total-time' | '(' 'is-violated' prefName ')';

optimization:
  'minimize' | 'maximize';

lengthSpec:
  '(' ':length' ('(' ':serial' INTEGER ')')? ('(' ':parallel' INTEGER ')')? ')';

name:
   NAME;

NAME: LETTER ANYCHAR* ;
LETTER: [azAZ];
ANYCHAR: LETTER | DIGIT | '-' | '_' ;
NUMBER: DIGIT+ DECIMAL?;
INTEGER: DIGIT+;
DIGIT: [0..9];
DECIMAL: '.' DIGIT+;
REQUIREMENT: ':strips' | ':typing' | ':negative-preconditions' | ':disjunctive-preconditions' | ':equality' | ':existential-preconditions' |
 ':universal-preconditions' | ':quantified-preconditions' | ':conditional-effects' | ':fluents' | ':numeric-fluents' | ':adl' |
  ':durative-actions' | ':duration-inequalities' | ':continuous-effects' | ':derived-predicates' | ':timed-initial-literals' |
   ':durative-actions' | ':preferences' | ':constraintsDefinition' | ':action-costs' ;

ASSIGNOP: 'assign' | 'scaleUp' | 'scaleDown' | 'increase' | 'decrease';

