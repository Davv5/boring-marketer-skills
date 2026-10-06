# Sequence architecture patterns

Read by the plan step when choosing how emails connect.

## The straight line

```
Email 1 -> Email 2 -> Email 3 -> Email 4 -> Pitch
```
Simple. Works for short sequences. No branches.

## The branch

```
Email 1 -> Email 2 -> [Clicked?] -> YES: Pitch sequence
                                 -> NO: More value sequence
```
Behavior-based. More sophisticated. Requires automation.

## The hybrid

```
Welcome (5 emails) -> [Wait 7 days] -> Conversion (5 emails) -> [No purchase] -> Nurture (ongoing)
```
Full lifecycle. Most complete.
