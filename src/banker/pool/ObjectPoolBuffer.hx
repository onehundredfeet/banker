package banker.pool;

import banker.container.buffer.top_aligned.TopAlignedBuffer;
import banker.container.buffer.top_aligned.StackExtension;
import banker.container.buffer.top_aligned.InternalExtension; // Necessary for spirits
import banker.vector.*; // Necessary for spirits

/**
	Array-based buffer with elements populated.
**/
#if !banker_generic_disable
@:generic
#end
@:ripper.verified
@:ripper.spirits(banker.container.buffer.top_aligned.constraints.Unordered)
@:ripper.spirits(banker.container.buffer.top_aligned.constraints.NotUnique)
class ObjectPoolBuffer<T> extends TopAlignedBuffer<T> implements ripper.Body {
	/**
		Creates an object pool populated with elements made by `factory()`.
	**/
	public function new(capacity: Int, factory: () -> T) {
		super(capacity);

		final elements = Vector.createPopulated(
			capacity,
			factory
		).ref.copyReversed();

		StackExtension.pushFromVector(this, elements);
	}
}
